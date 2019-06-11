<template>
    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <form id="my-form" class="am-form tpl-form-line-form" enctype="multipart/form-data" method="post">
                        <div class="widget-body">
                            <fieldset>
                                <div class="widget-head am-cf">
                                    <div class="widget-title am-fl">通知通告维护</div>
                                </div>

                                <el-form :model="noticeForm" :rules="rules" ref="noticeForm" label-width="200px" v-loading="isloading"
                                         class="am-form am-u-sm-11 tpl-form-line-form">
                                    <el-form-item label="通告内容" prop="content">
                                        <el-input v-model="noticeForm.content" class="tpl-form-input"></el-input>
                                    </el-form-item>
                                    <el-form-item label="有效期" prop="noticerangetime">
                                        <el-date-picker
                                                v-model="noticerangetime"
                                                type="datetimerange"
                                                range-separator="至"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                :default-time="['00:00:00', '23:59:59']"
                                                @change="changeDateRange"
                                                value-format="yyyy-MM-dd HH:mm:ss">
                                        </el-date-picker>
                                    </el-form-item>
                                </el-form>


                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3 am-margin-top-lg">
                                        <button type="button" class="j-submit am-btn am-btn-secondary" @click="handleSaveAbout">提交
                                        </button>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<style>

</style>
<script>
    import {getNotice,saveNotice} from '@/api/notice';
    import { mapGetters } from 'vuex'
    export default{
        data(){
            return{
                noticerangetime:[new Date()],
                isloading:false,
                noticeForm:{
                    id:"",
                    content:""
                },
                rules: {
                    content: [
                        {required: true, message: '请输入关于我们内容', trigger: 'blur'}
                    ],
                    noticerangetime:[
                        {required: true, message: '请输入有效期', trigger: 'blur'}
                    ]
                }
            }
        },
        created:function(){
            this.handleGetNotice();
        },
        computed: {
            ...mapGetters(['website'])
        },
        methods:{
            changeDateRange:function(value){
                if(value){
                    this.noticeForm.startTime=value[0];
                    this.noticeForm.endTime=value[1];
                }else{
                    this.noticeForm.startTime="";
                    this.noticeForm.endTime="";
                }
            },
            handleGetNotice(){
                getNotice().then(function(response){
                    if(response.data.data){
                        this.noticeForm = response.data.data
                    }
                });
            },
            handleSaveNotice(){
                this.isloading=true;
                saveNotice(this.noticeForm).then(res=>{
                    this.isloading=false;
                    if(res.data.code=200){
                        this.$notify({
                            title:'成功',
                            duration:2000,
                            message: '保存成功',
                            type: 'success',
                        });
                    }else{
                        this.$notify({
                            title:'操作失败',
                            showClose: true,
                            message: '保存失败',
                            type: 'error',
                        });
                    }
                });
            }

        }
    }
</script>
