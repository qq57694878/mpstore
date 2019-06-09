import request from '@/router/axios';
export const getCardList = (page) => request({
    url: '/api/card/getCardList',
    method: 'get',
    params: page
})
export const consumeServiceCard = (data) => request({
    url: '/api/card/consumeServiceCard',
    method: 'post',
    data: data
})
export const consumeECard = (data) => request({
    url: '/api/card/consumeECard',
    method: 'post',
    data: data
})