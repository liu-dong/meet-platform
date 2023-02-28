package com.dong.orderservice.web.model;

import org.apache.ibatis.session.RowBounds;

/**
 * @author zhang.jiaxin
 * @since 2023/2/21
 */
public class PageParam {

  public static RowBounds buildRowBounds(Integer pageNum, Integer pageSize) {
    int num = pageNum == null ? 1 : pageNum;
    int size = pageSize == null ? 5 : pageSize;
    return new RowBounds((num - 1) * size, size);
  }

}
