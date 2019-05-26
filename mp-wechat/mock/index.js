var Mock = require("../wxmock/WxMock.js"); 
import admin from "./admin.js"
console.log("执行admin mock");
admin({ Mock,ismock:true});