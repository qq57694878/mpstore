//app.js
import properties from "./utils/properties.js"
import aa from "./mock/index.js"
import {_get,_post} from "./utils/request.js"

App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo

              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
      ismock:true,
      page: 1, //初始加载商品时的页面号
      pageSize: 10000, //初始加载时的商品数，设置为10000保证小商户能加载完全部商品
      categories: [],
      goods: [],
      hotGoods: ['桔', '火龙果', '香蕉', '酸奶', '甘蔗'], //自定义热门搜索商品
      goodsName: [],
      goodsList: [],
      onLoadStatus: true,
      activeCategoryId: null,

      globalBGColor: '#00afb4',
      bgRed: 0,
      bgGreen: 175,
      bgBlue: 180,
      userInfo: null,
      subDomain: "tggtest",// 商城后台个性域名tgg
      version: "2.0.6",
      shareProfile: '   一流的服务，做超新鲜的水果' // 首页转发的时候术语
    },
    _get:_get,
    _post:_post,
  /**
* 显示成功提示框
*/
  showSuccess(msg, callback) {
    wx.showToast({
      title: msg,
      icon: 'success',
      success() {
        callback && (setTimeout(() => {
          callback();
        }, 1500));
      }
    });
  },

  /**
   * 显示失败提示框
   */
  showError(msg, callback) {
    wx.showModal({
      title: '友情提示',
      content: msg,
      showCancel: false,
      success(res) {
        callback && callback();
      }
    });
  },
})