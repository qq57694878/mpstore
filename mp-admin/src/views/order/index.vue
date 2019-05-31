<template>
    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-cf">订单列表</div>
                    </div>
                    <div class="widget-body am-fr">
                        <div class="order-list am-scrollable-horizontal am-u-sm-12 am-margin-top-xs">
                            <table width="100%" class="am-table am-table-centered
                        am-text-nowrap am-margin-bottom-xs">
                                <thead>
                                <tr>
                                    <th width="40%" class="goods-detail">商品信息</th>
                                    <th width="15%">金额</th>
                                    <th>买家</th>
                                    <th>交易状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <template v-for="item_order in orderList">

                                    <tr class="order-empty">
                                        <td colspan="6"></td>
                                    </tr>
                                    <tr>
                                        <td class="am-text-middle am-text-left" colspan="6">
                                            <span class="am-margin-right-lg"> {{ item_order.create_time}}</span>
                                            <span class="am-margin-right-lg">订单号：{{ item_order.order_no}}</span>
                                        </td>
                                    </tr>


                                    <tr v-for="(item_goods,i) in item_order['goods']">

                                        <td class="goods-detail am-text-middle">
                                            <div class="goods-image">
                                                <img :src="item_goods['image_url']" alt="">
                                            </div>
                                            <div class="goods-info">
                                                <p class="goods-title">{{ item_goods['goods_name'] }}</p>
                                                <p>￥{{ item_goods['goods_price'] }} ×{{ item_goods['total_num'] }}</p>
                                            </div>
                                        </td>

                                    <template v-if="i==0">
                                        <td class="am-text-middle" :rowspan="item_order['goods'].length">
                                            <p>实付款：￥{{ item_order['pay_price'] }}</p>
                                            <p class="am-link-muted">(订单金额：￥{{ item_order['total_price'] }})</p>
                                        </td>
                                        <td class="am-text-middle" :rowspan="item_order['goods'].length">
                                            <p>{{item_order['user']['nickName']}}</p>
                                            <p class="am-link-muted">(用户id：{{item_order['user']['user_id']}})</p>
                                        </td>
                                        <td class="am-text-middle" :rowspan="item_order['goods'].length">
                                            <p>付款状态：
                                                <span class="am-badge"
                                                      v-bind:class="[item_order.pay_status=='20' ? 'am-badge-success' : '']">
                                                        {{ item_order.pay_status }}</span>
                                            </p>
                                        </td>
                                        <td class="am-text-middle" :rowspan="item_order['goods'].length">
                                            <div class="tpl-table-black-operation">
                                                <router-link class="tpl-table-black-operation-green" :to="{path:`/order/detail/${item_order['order_no']}`,query:{order_no:`111`}}">
                                                    订单详情
                                                </router-link>
                                            </div>
                                        </td>
                                    </template>


                                    </tr>


                                </template>

                                <tr v-if="orderList.length==0">
                                    <td colspan="6" class="am-text-center">暂无记录</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="am-u-lg-12 am-cf">
                            <div class="am-fr"></div>
                            <div class="am-fr pagination-total am-margin-right">
                                <div class="am-vertical-align-middle">总记录：{{ orderList.length }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: "order",
        components: {},
        data() {
            return {

                page: {
                    total: 0, //总页数
                    currentPage: 1, //当前页数
                    pageSize: 10 //每页显示多少条
                },
                orderList: [
                    {
                        order_no: "111",
                        create_time: "2018-09-01 01:01:01",
                        total_price: 100,
                        pay_price: 100,
                        pay_status: 20,
                        user: {
                            user_id: 11111,
                            nickName: "这里风很大"
                        },
                        goods: [
                            {
                                goods_id: 1,
                                goods_price: 10,
                                goods_name: "机油",
                                total_num: 5,
                                image_url: "http://www.kulongtai.com/1.jpg",
                            },
                            {
                                goods_id: 2,
                                goods_price: 1000,
                                goods_name: "保养套餐",
                                total_num: 5,
                                image_url: "http://www.kulongtai.com/2.jpg",
                            }

                        ]

                    },
                    {
                        order_no: "222",
                        create_time: "2018-09-01 01:01:01",
                        total_price: 100,
                        pay_price: 100,
                        pay_status: 20,
                        user: {
                            user_id: 11111,
                            nickName: "这里风很大"
                        },
                        goods: [
                            {
                                goods_id: 1,
                                goods_price: 10,
                                goods_name: "机油",
                                total_num: 5,
                                image_url: "http://www.kulongtai.com/1.jpg",
                            },
                            {
                                goods_id: 2,
                                goods_price: 1000,
                                goods_name: "保养套餐",
                                total_num: 5,
                                image_url: "http://www.kulongtai.com/2.jpg",
                            }

                        ]

                    }
                ]
            };
        },
        created() {

        },
        watch: {},
        mounted() {
        },
        computed: {},
        props: [],
        methods: {}
    };
</script>

<style lang="scss" scoped>
    .table-container {
        padding: 8px 10px;
    }
</style>
