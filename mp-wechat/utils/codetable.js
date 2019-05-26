//0:未领取1: 已领取2: 待完成提交3: 提交待审核; 4:审核通过；5终止: 9:审核不通过

var codetable = {
  "taskStatus": { 0: '未领取', 1: '已领取', 2: '待完成提交',3: '提交待审核', 4: '完成，积分已核发',5:'任务已结束', 9: '审核不通过'},
  "taskType":{0:'完善个人信息任务',1:'完善店铺信息任务',3:'拍照任务'}
}
function getCodeValue(codeType,key){
  return codetable[codeType][key]
}
module.exports = {
  getCodeValue: getCodeValue
};