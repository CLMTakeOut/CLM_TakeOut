package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * author: Administrator
 * date: 2021/4/14 11:00
 * description:店铺
 */

@Data
@AllArgsConstructor
public class Shop {
    private Integer shopId;
    private String shopName;        //店铺名
    private String shopAddress;     //店铺地址
    private String shopContacts;    //联系人
    private String Telephone;       //联系电话
    private byte[] shopLogo;        //店铺logo
}
