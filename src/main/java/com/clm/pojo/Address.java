package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author: Administrator
 * @date: 2021/4/14 9:59
 * @description:地址实体类
 */
@Data
@AllArgsConstructor
public class Address {
    private Integer addressId;
    private Integer userId;
    private String name;        //姓名
    private String telephone;   //电话
    private String address;     //详细地址
}
