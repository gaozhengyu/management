package com.management.controller;

import java.util.UUID;

public class utils {
    public String Sex(int sexNumber){
        if(sexNumber == 0){
            return "男";
        }
        else {
            return "女";
        }
    }

    public int toNumber(String sex){
        if(sex.equals("男")){
            return 0;
        }
        else {
            return 1;
        }
    }

    //生成uuid32位
    public String getUUID32(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();
    }
    //生成15位长度uuid
    public String[] getUUID() {
        String[] uuidArr = new String[15];
        for (int i = 0; i < uuidArr.length; i++) {
            uuidArr[i] = getUUID32();
        }
        return uuidArr;
    }



}
