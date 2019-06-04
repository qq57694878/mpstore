<template>
    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-cf">出售中的商品</div>
                    </div>
                    <div class="widget-body am-fr">
                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                            <div class="am-form-group">
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <a class="am-btn am-btn-default am-btn-success am-radius"
                                           href="">
                                            <span class="am-icon-plus"></span> 新增
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am fr">
                                <div class="am-form-group am-fl">
                                    <select v-model="query.skuStatus"  >
                                        <option value="">所有状态</option>
                                        <option v-for="item in skuStatusOptions" :value="item.value">{{item.label}}</option>
                                    </select>
                                </div>
                                <div class="am-form-group am-fl">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form">
                                        <input v-model="query.skuName" placeholder="请输入商品名称"></input>
                                        <div class="am-input-group-btn">
                                            <button class="am-btn am-btn-default am-icon-search" type="submit" @click="doQuery"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="am-scrollable-horizontal am-u-sm-12">
                            <table width="100%" class="am-table am-table-compact am-table-striped
                         tpl-table-black am-text-nowrap" v-loading="loading">
                                <thead>
                                <tr>
                                    <th>商品ID</th>
                                    <th>商品图片</th>
                                    <th>商品名称</th>
                                    <th>实际销量</th>
                                    <th>商品排序</th>
                                    <th>商品状态</th>
                                    <th>添加时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="$item in skuList">
                                    <td class="am-text-middle">{{$item['skuId']}}</td>
                                    <td class="am-text-middle">
                                        <a :href="$item['main_url']"
                                           title="点击查看大图" target="_blank">
                                            <img :src="$item['mainUrl']"
                                                 width="50" height="50" alt="商品图片">
                                        </a>
                                    </td>
                                    <td class="am-text-middle">
                                        <p class="item-title">{{ $item['skuName'] }}</p>
                                    </td>
                                    <td class="am-text-middle">{{ $item['salesNum'] }}</td>
                                    <td class="am-text-middle">{{ $item['sort'] }}</td>
                                    <td class="am-text-middle">
                                            <span :class="$item['skuStatus'] == 1 ? 'x-color-green'
                                                : 'x-color-red'">
                                            {{ $item['skuStatus'] | code2value('sku_status') }}
                                            </span>
                                    </td>
                                    <td class="am-text-middle">{{ $item['createTime'] | moment('YYYY-MM-DD HH:mm:ss')}}
                                    </td>
                                    <td class="am-text-middle">
                                        <div class="tpl-table-black-operation">
                                            <a href="#">
                                                <i class="am-icon-pencil"></i> 编辑
                                            </a>
                                            <a href="javascript:;" class="item-delete tpl-table-black-operation-del">
                                                <i class="am-icon-trash"></i> 删除
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr v-if="skuList.length==0">
                                    <td colspan="9" class="am-text-center">暂无记录</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="am-u-lg-12 am-cf">
                            <div class="am-fr">
                                <el-pagination
                                        @size-change="handleSizeChange"
                                        @current-change="handleCurrentChange"
                                        :current-page="query.current"
                                        :page-sizes="[10, 20, 50, 100]"
                                        :page-size="query.size"
                                        layout="total, sizes, prev, pager, next, jumper"
                                        :total="total">
                                </el-pagination>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style>

</style>
<script>
    import {getSkuList} from '@/api/sku'
    import {type2options} from '@/util/codeTable'
    export default {
        data() {
            return {
                skuStatusOptions: type2options("sku_status"),
                loading: false,
                msg: 'hello vue',
                query: {
                    current: 1,
                    size: 10,
                    skuName: "",
                    skuStatus: ""
                },
                total: 0,
                skuList: [],
                /*   skuList: [
                 {
                 skuName: "保养机油套餐",
                 createTime: new Date().getTime(),
                 skuStatus: "1",
                 salesNum: 100,
                 sort: 1,
                 skuId: 100001,
                 mainUrl: "http://www.kulongtai.com/1.jpg"
                 },
                 {
                 skuName: "保养机油套餐1",
                 createTime: new Date().getTime(),
                 skuStatus: "2",
                 salesNum: 101,
                 sort: 2,
                 skuId: 100002,
                 mainUrl: "http://www.kulongtai.com/2.jpg"
                 }
                 ]*/
            }
        },
        created() {
            this.handleList();
        },
        components: {},
        methods: {
            doQuery(){
                this.handleList();
            },
            handleSizeChange(val) {
                this.query.size = val;
                console.log(`每页 ${val} 条`);
                this.handleList();
            },
            handleCurrentChange(val) {
                this.query.current = val;
                console.log(`当前页: ${val}`);
                this.handleList();
            },
            /**
             * @title 获取数据
             * @detail 赋值为tableData表格即可
             *
             **/
            handleList() {
                console.log(this.query);
                this.loading = true;
                getSkuList(this.query)
                    .then(res => {
                        const data = res.data.data;
                        setTimeout(() => {
                            this.skuList = data.records;
                            this.total = data.total;
                            this.loading = false;
                        }, 1000);
                    });
            }
        }
    }


</script>
