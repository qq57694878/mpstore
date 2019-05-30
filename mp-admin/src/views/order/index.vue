<template>
    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-cf">{{ title }}</div>
                    </div>
                    <div class="widget-body am-fr">
                        <div class="order-list am-scrollable-horizontal am-u-sm-12 am-margin-top-xs">
                            <table width="100%" class="am-table am-table-centered
                        am-text-nowrap am-margin-bottom-xs">
                                <thead>
                                <tr>
                                    <th width="30%" class="goods-detail">商品信息</th>
                                    <th width="10%">单价/数量</th>
                                    <th width="15%">实付款</th>
                                    <th>买家</th>
                                    <th>交易状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <template  v-for="$order in orderList" v-bind:key="$order.order_no">

                                <tr class="order-empty">
                                    <td colspan="6"></td>
                                </tr>
                                <tr>
                                    <td class="am-text-middle am-text-left" colspan="6">
                                        <span class="am-margin-right-lg"> {{ $order.create_time}}</span>
                                        <span class="am-margin-right-lg">订单号：{{ $order.order_no}}</span>
                                    </td>
                                </tr>


                                <tr v-for="{$goods,$i} in $order['goods']" v-bind:key="$goods.goods-id">
                                    <td class="goods-detail am-text-middle">
                                        <div class="goods-image">
                                            <img :src="$goods['image']['file_path']" alt="">
                                        </div>
                                        <div class="goods-info">
                                            <p class="goods-title">{{ $goods['goods_name'] }}</p>
                                            <p class="goods-spec am-link-muted">
                                                {{ $goods['goods_attr'] }}
                                            </p>
                                        </div>
                                    </td>
                                    <td class="am-text-middle">
                                        <p>￥{{ $goods['goods_price'] }}</p>
                                        <p>×{{ $goods['total_num'] }}</p>
                                    </td>
                                    <?php if ($i === 1) : $goodsCount = count($order['goods']); ?>
                                    <td class="am-text-middle" :rowspan="$order['goods'].length">
                                        <p>￥<?= $order['pay_price'] ?></p>
                                        <p class="am-link-muted">(含运费：￥<?= $order['express_price'] ?>)</p>
                                    </td>
                                    <td class="am-text-middle" rowspan="<?= $goodsCount ?>">
                                        <p><?= $order['user']['nickName'] ?></p>
                                        <p class="am-link-muted">(用户id：<?= $order['user']['user_id'] ?>)</p>
                                    </td>
                                    <td class="am-text-middle" rowspan="<?= $goodsCount ?>">
                                        <p>付款状态：
                                            <span class="am-badge" v-bind:class="[$order.pay_status=='20' ? 'am-badge-success' : '']" >
                                                        {{ $order.pay_status }}</span>
                                        </p>

                                    </td>
                                    <td class="am-text-middle" rowspan="<?= $goodsCount ?>">
                                        <div class="tpl-table-black-operation">
                                            <a class="tpl-table-black-operation-green"
                                               :href="">
                                                订单详情</a>

                                        </div>
                                    </td>
                                    <?php endif; ?>
                                </tr>
                                </template>

                                <tr v-if="orderList.length==0">
                                    <td colspan="6" class="am-text-center">暂无记录</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="am-u-lg-12 am-cf">
                            <div class="am-fr">  </div>
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
    import { mapGetters } from "vuex";
    export default {
        name: "role",
        components: {},
        data () {
            return {
                tableOption: {}, //表格设置属性
                tableData: [], //表格的数据
                tablePage: 1,
                tableLoading: false,
                tabelObj: {},
                page: {
                    total: 0, //总页数
                    currentPage: 1, //当前页数
                    pageSize: 10 //每页显示多少条
                },
                grade: {
                    box: false,
                    check: []
                }
            };
        },
        created () {

        },
        watch: {},
        mounted () { },
        computed: {

        },
        props: [],
        methods: {

        }
    };
</script>

<style lang="scss" scoped>
    .table-container {
        padding: 8px 10px;
    }
</style>
