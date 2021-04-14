package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * date: 2021年04月14日 8:59
 * 描述:商品实体类
 * Author: 薛定谔的猫er
 */

@Data
@AllArgsConstructor
public class Goods {
    private Integer goodsId;
    private Integer shopId;
    private String goodsName;      //商品名
    private Double price;        //价格
    private Integer salesVolume;      //销售量
    private Integer score;      //评分
    private String describe;    //商品描述
    private byte[] goodsLogo;  //商品图片
    private Boolean goodsRecommend;     //推荐商品
}
