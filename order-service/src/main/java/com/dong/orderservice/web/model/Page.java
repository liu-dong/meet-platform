package com.dong.orderservice.web.model;

import java.util.List;
import lombok.Data;

/**
 * @author zhang.jiaxin
 * @since 2023/2/20
 */
@Data
public class Page<T> {

  /**
   * 总数
   */
  private int total;

  /**
   * 当前页
   */
  private int pageNum;

  /**
   * 每页的数量
   */
  private int pageSize;

  /**
   * 总页数
   */
  private int pages;

  private List<T> listData;

}
