package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * author: Administrator
 * date: 2021/4/14 10:55
 * description:公告
 */

@Data
@AllArgsConstructor
public class Notice {
    private Integer noticeId;
    private Integer userId;
    private String noticeDetail;       //公告详情
}
