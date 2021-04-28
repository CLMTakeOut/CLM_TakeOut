package com.clm.utils;

import com.alibaba.fastjson.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResMessage {
    Integer status; // 状态码
    String msg; // 信息
    JSONObject data; // 具体数据
}
