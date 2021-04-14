package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author: Administrator
 * @date: 2021/4/14 10:57
 * @description:订单
 */

@Data
@AllArgsConstructor
public class Order {
    private Integer orderId;
    private Integer userId;
    private Integer shopId;
    private Integer goodsId;
    private String orderTime;       //下单时间
    private String orderStatus;     //订单状态
}
