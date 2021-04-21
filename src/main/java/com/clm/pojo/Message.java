package com.clm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    Integer status; // 状态码
    String msg; // 信息
    String data; // 具体数据
}
