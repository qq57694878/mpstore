<template>
    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-body  am-margin-bottom-lg">
                        <div class="am-u-sm-12">
                      
                            <ul class="order-detail-progress progress-2">
                                <li>
                                    <span>下单时间</span>
                                    <div class="tip">{{$detail['create_time'] }}</div>
                                </li>
                                <li>
                                    <span>付款</span>
                             
                                    <div class="tip" v-if="$detail['pay_status']=='1'">
                                        付款于 {{ date('Y-m-d H:i:s', $detail['pay_time']) }}
                                    </div>
                                 
                                </li>

                            </ul>
                        </div>

                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">基本信息</div>
                        </div>
                        <div class="am-scrollable-horizontal">
                            <table class="regional-table am-table am-table-bordered am-table-centered
                            am-text-nowrap am-margin-bottom-xs">
                                <tbody>
                                <tr>
                                    <th>订单号</th>
                                    <th>实付款</th>
                                    <th>买家</th>
                                    <th>交易状态</th>
                                </tr>
                                <tr>
                                    <td>{{ $detail['order_no'] }}</td>
                                    <td>
                                        <p>实付款：￥{{ $detail['pay_price'] }}</p>
                                        <p class="am-link-muted">(订单金额：￥{{ $detail['express_price'] }})</p>
                                    </td>
                                    <td>
                                        <p>{{ $detail['user']['nickName'] }}</p>
                                        <p class="am-link-muted">(用户id：{{ $detail['user']['user_id'] }})</p>
                                    </td>
                                    <td>
                                        <p>付款状态：
                                            <span class="am-badge" :class="[$detail['pay_status']==1?'am-badge-success':'']">
                                                {{ $detail['pay_status'] }}</span>
                                        </p>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">商品信息</div>
                        </div>
                        <div class="am-scrollable-horizontal">
                            <table class="regional-table am-table am-table-bordered am-table-centered
                            am-text-nowrap am-margin-bottom-xs">
                                <tbody>
                                <tr>
                                    <th>商品名称</th>
                                    <th>商品编码</th>
                                    <th>重量(Kg)</th>
                                    <th>单价</th>
                                    <th>购买数量</th>
                                    <th>商品总价</th>
                                </tr>

                                <tr v-for="$goods in $detail['goods'] ">
                                    <td class="goods-detail am-text-middle">
                                        <div class="goods-image">
                                            <img :src="$goods['image_url']" alt="">
                                        </div>
                                        <div class="goods-info">
                                            <p class="goods-title">{{ $goods['goods_name'] }}</p>
                                        </div>
                                    </td>
                                    <td>{{ $goods['goods_no'] ? $goods['goods_no']: '--' }}</td>
                                    <td>{{ $goods['goods_weight'] ?$goods['goods_weight']: '--' }}</td>
                                    <td>￥{{ $goods['goods_price'] }}</td>
                                    <td>×{{ $goods['total_num'] }}</td>
                                    <td>￥{{ $goods['total_price'] }}</td>
                                </tr>

                                <tr>
                                    <td colspan="6" class="am-text-right">总计金额：￥{{ $detail['total_price'] }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>





                        <template v-if="$detail.pay_status=='1'">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">付款信息</div>
                            </div>
                            <div class="am-scrollable-horizontal">
                                <table class="regional-table am-table am-table-bordered am-table-centered
                                am-text-nowrap am-margin-bottom-xs">
                                    <tbody>
                                    <tr>
                                        <th>应付款金额</th>
                                        <th>支付方式</th>
                                        <th>支付流水号</th>
                                        <th>付款状态</th>
                                        <th>付款时间</th>
                                    </tr>
                                    <tr>
                                        <td>￥{{ $detail['pay_price'] }}</td>
                                        <td>微信支付</td>
                                        <td>{{ $detail['transaction_id'] ? $detail['transaction_id']: '--' }}</td>
                                        <td>
                                        <span class="am-badge" :class="[$detail['pay_status']=='1'?'am-badge-success':'']">
                                                {{ $detail['pay_status'] }}</span>
                                        </td>
                                        <td>
                                            {{ $detail['pay_time'] ? date('Y-m-d H:i:s', $detail['pay_time']) : '--' }}
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </template>



                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: "orderDetail",
        components: {},
        data() {
            return {

                page: {
                    total: 0, //总页数
                    currentPage: 1, //当前页数
                    pageSize: 10 //每页显示多少条
                },
                $detail: {
                        order_no: "111",
                        create_time: "2018-09-01 01:01:01",
                        total_price: 100,
                        pay_price: 100,
                        pay_status: 1,
                        transaction_id:"11111111111111",
                        pay_time:'2019-05-01 12:00:00',
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
