package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * author: Administrator
 * date: 2021/4/14 10:51
 * description:收藏
 */

@Data
@AllArgsConstructor
public class Collection {
    private Integer collectionId;
    private Integer userId;
    private Integer goodsId;
}
