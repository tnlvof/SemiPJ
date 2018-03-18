package com.kh.pj.analyse.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class AnalyseMethod {
	public AnalyseMethod(){}
	
	public String[] getCatagoryName(String catagoryCode){
		String[] catagoryName = new String[2];
		
		switch(catagoryCode.substring(0, 3)){
		case "CS1" : catagoryName[0] = "외식업"; break;
		case "CS2" : catagoryName[0] = "서비스업"; break;
		case "CS3" : catagoryName[0] = "도소매업"; break;
		}
		
		switch(catagoryCode){
		case "CS100001" : catagoryName[1] = "한식음식점"; break;
		case "CS100002" : catagoryName[1] = "중국집"; break;
		case "CS100003" : catagoryName[1] = "일식집"; break;
		case "CS100004" : catagoryName[1] = "양식집"; break;
		case "CS100005" : catagoryName[1] = "분식집"; break;
		case "CS100006" : catagoryName[1] = "패스트푸드점"; break;
		case "CS100007" : catagoryName[1] = "치킨집"; break;
		case "CS100008" : catagoryName[1] = "제과점"; break;
		case "CS100009" : catagoryName[1] = "커피음료"; break;
		case "CS100010" : catagoryName[1] = "호프간이주점"; break;
		case "CS200001" : catagoryName[1] = "입시보습학원"; break;
		case "CS200002" : catagoryName[1] = "외국어학원"; break;
		case "CS200003" : catagoryName[1] = "예체능학원"; break;
		case "CS200004" : catagoryName[1] = "치과의원"; break;
		case "CS200005" : catagoryName[1] = "한의원"; break;
		case "CS200006" : catagoryName[1] = "일반의원"; break;
		case "CS200007" : catagoryName[1] = "보육시설"; break;
		case "CS200008" : catagoryName[1] = "부동산중개업"; break;
		case "CS200009" : catagoryName[1] = "인테리어"; break;
		case "CS200010" : catagoryName[1] = "노래방"; break;
		case "CS200011" : catagoryName[1] = "PC방"; break;
		case "CS200012" : catagoryName[1] = "당구장"; break;
		case "CS200013" : catagoryName[1] = "골프연습장"; break;
		case "CS200014" : catagoryName[1] = "헬스클럽"; break;
		case "CS200015" : catagoryName[1] = "노인요양시설"; break;
		case "CS200016" : catagoryName[1] = "미용실"; break;
		case "CS200017" : catagoryName[1] = "네일숍"; break;
		case "CS200018" : catagoryName[1] = "피부관리실"; break;
		case "CS200019" : catagoryName[1] = "여관업"; break;
		case "CS200020" : catagoryName[1] = "세탁소"; break;
		case "CS200021" : catagoryName[1] = "자동차수리"; break;
		case "CS200022" : catagoryName[1] = "자동차미용"; break;
		case "CS300001" : catagoryName[1] = "슈퍼마켓"; break;
		case "CS300002" : catagoryName[1] = "편의점"; break;
		case "CS300003" : catagoryName[1] = "컴퓨터판매수리"; break;
		case "CS300004" : catagoryName[1] = "휴대폰"; break;
		case "CS300005" : catagoryName[1] = "정육점"; break;
		case "CS300006" : catagoryName[1] = "과일채소"; break;
		case "CS300007" : catagoryName[1] = "의류점"; break;
		case "CS300008" : catagoryName[1] = "패션잡화"; break;
		case "CS300009" : catagoryName[1] = "약국"; break;
		case "CS300010" : catagoryName[1] = "문구점"; break;
		case "CS300011" : catagoryName[1] = "화장품"; break;
		}
		
		return catagoryName;
	}
	
	public String getJob(String catagoryCode){
		String xName = null;
		String code = null;
		switch(catagoryCode.substring(0, 3)){
		case "CS1" : xName = new String("'한식음식점','중국집','일식집','양식집','분식집','패스트푸드점','치킨집','제과점','커피음료','호프간이주점'"); 
					code = new String("'CS100001','CS100002','CS100003','CS100004','CS100005','CS100006','CS100007','CS100008','CS100009','CS100010'");break;
		case "CS2" : xName = new String("'입시보습학원','외국어학원','예체능학원','치과의원','한의원','일반의원','보육시설','부동산중개업','인테리어','노래방','PC방','당구장','골프연습장','헬스클럽','노인요양시설','미용실','네일숍','피부관리실','여관업','세탁소','자동차수리','자동차미용'"); 
					code = new String("'CS200001','CS200002','CS200003','CS200004','CS200005','CS200006','CS200007','CS200008','CS200009','CS200010','CS200011','CS200012','CS200013','CS200014','CS200015','CS200016','CS200017','CS200018','CS200019','CS200020','CS200021','CS200022'");break;
		case "CS3" : xName = new String("'슈퍼마켓','편의점','컴퓨터판매수리','휴대폰','정육점','과일채소','의류점','패션잡화','약국','문구점','화장품'"); 
					code = new String("'CS300001','CS300002','CS300003','CS300004','CS300005','CS300006','CS300007','CS300008','CS300009','CS300010','CS300011'"); break;
		}
		return xName;
	}
	
	public String getData(String code, int cut, ArrayList<HashMap> list){
		String data = "";
		String datas = "";
		for(int i = list.size()-1; i >= 0; i--){
			if(!String.valueOf(list.get(i).get(code)).equals("null")){
				if(String.valueOf(list.get(i).get(code)).contains(".")){
					data = String.valueOf(list.get(i).get(code));
				}else{
					data = String.valueOf((int)(Long.parseLong(String.valueOf(list.get(i).get(code))))/cut);
				}				
			}else{
				data = "0";
			}
			if(i==list.size()-1){
				datas += data +"";
			}else{
				datas += ","+data;
			}
		}
		
		return datas;
	}
	
	public String getData2(String[] values, int cut){
		long temp = 0;
		String data = "";
		for(int i = 0; i < values.length; i++){
			if(!String.valueOf(values[i]).equals("null")){
				temp = Long.parseLong(String.valueOf(values[i]));
			}else{
				temp = 0;
			}

			if(i==0){
				data += (int)(temp/cut) +"";
			}else{
				data += ","+(int)(temp/cut);
			}
		}
		return data;
	}
	
	public String getCategories(String code, ArrayList<HashMap> list){
		String categories = "";
		for(int i = list.size()-1; i >= 0; i--){
			if(i==list.size()-1){
				categories += "'"+list.get(i).get(code)+"'";
			}else{
				categories += ",'"+list.get(i).get(code)+"'";
			}
		}
			
		return categories;
	}
	
	public String getBar(String[] barText, String[] dataName, String[] data){
		
		String series = "";
		for (int i = 0; i < dataName.length; i++) {
			if(i==0){
				series += "{ name: '"+dataName[i]+"', data: ["+data[i]+"]}";
			}else{
				series += ",{ name: '"+dataName[i]+"', data: ["+data[i]+"]}";
			}			
		}
		String bar = "\n$('."+barText[0]+"').highcharts(" + 
				"\n{chart: {type: 'column'},"+
			    "\ntitle: {text: '"+barText[1]+"'},"+
			    "\nxAxis: {categories: ["+barText[4]+"],crosshair: true},"+
			    "\nyAxis: {min: 0,title: {text: '"+barText[2]+"'}},"+
			    "\ntooltip: {headerFormat: '<span style=\"font-size:10px\">{point.key}</span><table>',"+
			    "\npointFormat: '<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td><td style=\"padding:0\"><b>{point.y:.1f} "+barText[3]+"</b></td></tr>',"+
			        "\nfooterFormat: '</table>',shared: true,useHTML: true},"+
			    "\nplotOptions: {column: {pointPadding: 0.2,borderWidth: 0}},"+
			    "\nseries: ["+series+"]"+
			    "\n});";
		    
		return bar;
	}
	
public String getLine(String[] lineText, String[] dataName, String[] data){	
		String series = "";
		for (int i = 0; i < dataName.length; i++) {
			if(i==0){
				series += "{ name: '"+dataName[i]+"', data: ["+data[i]+"]}";
			}else{
				series += ",{ name: '"+dataName[i]+"', data: ["+data[i]+"]}";
			}
		}
		String line = "\n$('."+ lineText[0]+"').highcharts({"+
				"\ntitle: {text: '"+lineText[1]+"',x: -20},"+
				"\nxAxis: {categories:["+lineText[4]+"]},"+
				"\nyAxis: {title: {text: '"+lineText[2]+"'},plotLines: [{value: 0,width: 1,color: '#808080'}]},"+
				"\ntooltip: {valueSuffix: '"+ lineText[3]+"'},"+
				"\nlegend: {layout: 'vertical', align: 'right',verticalAlign: 'middle',borderWidth: 0},"+
				"\ncredits: {enabled: false},"+
				"\nseries: ["+series+"]"+
				"\n});";
		return line;
	}

public String getPie(String[] pieText, String[] dataName, String[] data){
	String series = "";
	for (int i = 0; i < dataName.length; i++) {
		if(i==0){
			series += "{name:'"+dataName[i]+"', y: "+data[i]+"}";
		}else{
			series += ",{name:'"+dataName[i]+"', y: "+data[i]+"}";
		}
	}
	String pie = "\n$('."+pieText[0]+"').highcharts(" +
			"\n{chart: {plotBackgroundColor: null,plotBorderWidth: null,plotShadow: false,type: 'pie'}," +
			"\ntitle: {text: '"+pieText[1]+"'},"+
			"\ntooltip: {pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'},"+
			"\nplotOptions: {pie: {allowPointSelect: true,cursor: 'pointer',"+
						"\ndataLabels: {enabled: true,format: '<b>{point.name}</b>: {point.percentage:.1f} %',"+
						"\nstyle: {color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'}}}},"+
			"\nseries: [{name: '"+pieText[2]+"',colorByPoint: true,"+
					"\ndata: ["+series+"]}]"+
			"\n});";
	return pie;
	}	
}
