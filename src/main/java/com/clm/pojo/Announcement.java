package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author: Administrator
 * @date: 2021/4/14 10:01
 * @description:公告实体类
 */

@Data
@AllArgsConstructor
public class Announcement {
    private Integer announcementId;
    private Integer shopId;
    private Integer userId;
    private byte[] picture;     //图片
}
