import request from '@/router/axios';
export const getSkuList = (page) => request({
    url: '/api/sku/getSkuList',
    method: 'get',
    params: page
})