import request from '@/router/axios';
export const getSkuList = (page) => request({
    url: '/sku/getSkuList',
    method: 'get',
    data: { page }
})