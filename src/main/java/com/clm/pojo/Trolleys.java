package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author: Administrator
 * @date: 2021/4/14 11:04
 * @description:购物车
 */

@Data
@AllArgsConstructor
public class Trolleys {
    private Integer trolleysId;
    private Integer userId;
    private Integer goodsId;
    private Integer shopId;
}
