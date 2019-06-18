let App = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    skuList: [{
      skuId: 1, skuName: "小保养", skuPrice: 100, linePrice: 120, mainUrl: "http://www.kulongtai.com/1.jpg", salesNum: 10,
      content: "<img src='http://www.kulongtai.com/1.jpg' />", total_num:10
    }, {
      skuId: 1, skuName: "小保养", skuPrice: 100, linePrice: 120, mainUrl: "http://www.kulongtai.com/1.jpg", salesNum: 10,
        content: "<img src='http://www.kulongtai.com/1.jpg' />", total_num: 10
      }, {
        skuId: 1, skuName: "小保养", skuPrice: 100, linePrice: 120, mainUrl: "http://www.kulongtai.com/1.jpg", salesNum: 10,
        content: "<img src='http://www.kulongtai.com/1.jpg' />", total_num: 10
      }, ], // 商品列表
    order_total_num: 0,
    order_total_price: 0,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    this.getCartList();
  },

  /**
   * 获取购物车列表
   */
  getCartList: function () {
    let _this = this;
    App._get('/mpapi/cart/list', {}).then(res=>{
        res
    });
  },

  /**
   * 递增指定的商品数量
   */
  addCount: function (e) {
    let _this = this,
      index = e.currentTarget.dataset.index,
      goodsSkuId = e.currentTarget.dataset.skuId,
      goods = _this.data.goods_list[index],
      order_total_price = _this.data.order_total_price;
    // 后端同步更新
    wx.showLoading({
      title: '加载中',
      mask: true
    })
    App._post('/cart/add', {
      goods_id: goods.goods_id,
      goods_num: 1,
      goods_sku_id: goodsSkuId
    }).then(function () {
      wx.hideLoading();
      goods.total_num++;
      _this.setData({
        ['goods_list[' + index + ']']: goods,
        order_total_price: _this.mathadd(order_total_price, goods.goods_price)
      });
    });
  },

  /**
   * 递减指定的商品数量
   */
  minusCount: function (e) {
    let _this = this,
      index = e.currentTarget.dataset.index,
      goodsSkuId = e.currentTarget.dataset.skuId,
      goods = _this.data.goods_list[index],
      order_total_price = _this.data.order_total_price;

    if (goods.total_num > 1) {
      // 后端同步更新
      wx.showLoading({
        title: '加载中',
        mask: true
      })
      App._post('/cart/sub', {
        goods_id: goods.goods_id,
        goods_sku_id: goodsSkuId
      }).then(function () {
        wx.hideLoading();
        goods.total_num--;
        goods.total_num > 0 &&
          _this.setData({
            ['goods_list[' + index + ']']: goods,
            order_total_price: _this.mathsub(order_total_price, goods.goods_price)
          });
      });

    }
  },

  /**
   * 删除商品
   */
  del: function (e) {
    let _this = this,
      goods_id = e.currentTarget.dataset.goodsId,
      goodsSkuId = e.currentTarget.dataset.skuId;
    wx.showModal({
      title: "提示",
      content: "您确定要移除当前商品吗?",
      success: function (e) {
        e.confirm && App._post('/cart/delete', {
          goods_id,
          goods_sku_id: goodsSkuId
        }).then( function (result) {
          _this.getCartList();
        });
      }
    });
  },

  /**
   * 购物车结算
   */
  submit: function (t) {
    wx.navigateTo({
      url: '../flow/checkout?order_type=cart'
    });
  },

  /**
   * 加法
   */
  mathadd: function (arg1, arg2) {
    return (Number(arg1) + Number(arg2)).toFixed(2);
  },

  /**
   * 减法
   */
  mathsub: function (arg1, arg2) {
    return (Number(arg1) - Number(arg2)).toFixed(2);
  },

  /**
   * 去购物
   */
  goShopping: function () {
    wx.switchTab({
      url: '../tabbar/home',
    });
  },

})