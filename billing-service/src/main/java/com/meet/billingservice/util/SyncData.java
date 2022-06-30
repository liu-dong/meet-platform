package com.meet.billingservice.util;

import cn.hutool.http.Header;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.meet.billingservice.web.dao.SsjJpaDao;
import com.meet.billingservice.web.entity.Suishouji;
import com.meet.billingservice.web.model.DataDTO;
import com.meet.commoncore.util.SpringUtils;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudong 2022/6/30
 */
public class SyncData {

    public static List<DataDTO> post(int page) {
        String cookie = "Hm_lvt_3db4e52bb5797afe0faaa2fde5c96ea4=1656580489; __nick=15170519059; SESSION_COOKIE=a8e14a3d3446b0d7b8155ae885f316e7; __spm_bid=c50eba963305s77fp002acd5b3m2c546; __utma=121176714.1310128488.1656580531.1656580531.1656580531.1; __utmc=121176714; __utmz=121176714.1656580531.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1; _bookTabSwitchList=8e56fa72cd32fd515374562281762667|4|0&; SESSION=4dd562f8-6384-4b34-bfb7-cf3d6c8bf00d; Hm_lpvt_3db4e52bb5797afe0faaa2fde5c96ea4=1656580555; __utmb=121176714.8.10.1656580531; closeGuide=1";
        String url = "https://www.sui.com/tally/new.rmi?opt=list2&beginDate=2020.01.01&endDate=2022.06.30&cids=0&bids=0&sids=0&pids=0&memids=0&order=&isDesc=0&note=&mids=1&page=" + page;
        String result = HttpRequest.post(url).header(Header.COOKIE, cookie).execute().body();
        boolean typeJSONObject = JSONUtil.isTypeJSONObject(result);
        List<DataDTO> dataDTOList = new ArrayList<>();
        if (typeJSONObject) {
            JSONObject entries = JSONUtil.parseObj(result);
            JSONArray groups = (JSONArray) entries.get("groups");
            for (Object group : groups) {
                JSONObject groupJson = (JSONObject) group;
                JSONArray list = (JSONArray) groupJson.get("list");
                for (Object obj : list) {
                    JSONObject objJson = (JSONObject) obj;
                    JSONObject date = (JSONObject) objJson.get("date");
                    DataDTO dataDTO = JSONUtil.toBean(objJson, DataDTO.class);
                    DataDTO dto = JSONUtil.toBean(date, DataDTO.class);
                    dataDTO.setDate(dto.getDate());
                    dataDTO.setDay(dto.getDay());
                    dataDTO.setHours(dto.getHours());
                    dataDTO.setMinutes(dto.getMinutes());
                    dataDTO.setMonth(dto.getMonth());
                    dataDTO.setSeconds(dto.getSeconds());
                    dataDTO.setTime(dto.getTime());
                    dataDTO.setTimezoneOffset(dto.getTimezoneOffset());
                    dataDTO.setYear(dto.getYear());
                    dataDTOList.add(dataDTO);
                }
            }
            System.out.println(dataDTOList.size());
        }
        return dataDTOList;
    }
}
