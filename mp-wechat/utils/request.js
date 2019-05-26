const properties = require('properties');
function  post(suburl,data){
  wx.showNavigationBarLoading(); //在标题栏中显示加载
  var token = wx.getStorageSync('token');
  if (!token){
    wx.showToast({
      title: 'token获取失败',
      duration: 2000
    })
  }
  return new Promise((resolve, reject) => {
    wx.request({
      url: properties.hostUrl + suburl,
      data: data?data:"",
      header: {
        'token': token,
        'content-type': 'application/json' // 默认值
      },
      method: 'POST',
      dataType: 'json',
      success: function (res) {
        resolve(res.data)
      },
      fail: function (res) {
        wx.showToast({
          icon:'none',
          title: '加载失败',
          duration: 2000
        })
        reject(res.data)
      },
      complete: function () {
        wx.hideNavigationBarLoading(); //完成停止加载
      }
    })
  });
}
function getjson(suburl, data) {
  wx.showNavigationBarLoading(); //在标题栏中显示加载
  var token = wx.getStorageSync('token');
  if (!token) {
    wx.showToast({
      title: 'token获取失败',
      duration: 2000
    })
  }
  return new Promise((resolve, reject) => {
    wx.request({
      url: properties.hostUrl + suburl,
      data: data ? data : "",
      header: {
        'token': token
      },
      method: 'GET',
      dataType: 'json',
      success: function (res) {
        resolve(res.data)
      },
      fail: function (res) {
        wx.showToast({
          icon: 'none',
          title: '加载失败',
          duration: 2000
        })
        reject(res.data)
      },
      complete: function () {
        wx.hideNavigationBarLoading(); //完成停止加载
      }
    })
  });
}

module.exports = {
  _post: post,
  _get: getjson,
  
};