package com.kh.pj.analyse.controller;

import java.io.*;
import java.util.*;

import org.json.simple.*;
import org.json.simple.parser.*;

public class DoAnalyse {

	public String get2Line(String[] lineText, ArrayList<HashMap> front, ArrayList<HashMap> back){
		String xName = "";
		long value1 = 0;
		long value2 = 0;
		String values1 = "";
		String values2 = "";
		Double cut = Double.parseDouble(lineText[5]);


		String recentDate = String.valueOf(front.get(0).get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(front.get(0).get("기준_년월_코드")).substring(4, 6) + "월";
		
		for(int i = front.size()-1; i >= 0; i--){
			if(!String.valueOf(front.get(i).get(lineText[4])).equals("null")){
				value1 = Long.parseLong(String.valueOf(front.get(i).get(lineText[4])));
			}else{
				value1 = 0;
			}
			
			if(!String.valueOf(back.get(i).get(lineText[4])).equals("null")){
				value2 = Long.parseLong(String.valueOf(back.get(i).get(lineText[4])));
			}else{
				value2 = 0;

			}

			if(i==front.size()-1){
				xName += "'"+front.get(i).get("기준_년월_코드")+"'";

				values1 += (int)(value1/cut) +"";
				values2 += (int)(value2/cut) +"";
			}else{
				xName += ",'"+front.get(i).get("기준_년월_코드")+"'";
				values1 += ","+(int)(value1/cut);
				values2 += ","+(int)(value2/cut);
			}
		}
		
		String line = "\n$('."+ lineText[0]+"').highcharts({"+
					"title: {text: '"+lineText[1]+"("+recentDate+"기준)',x: -20},"+
					"xAxis: {categories:["+xName+"]},"+
					"yAxis: {title: {text: '"+lineText[2]+"'},plotLines: [{value: 0,width: 1,color: '#808080'}]},"+
					"tooltip: {valueSuffix: '"+ lineText[3]+"'},"+
					"legend: {layout: 'vertical', align: 'right',verticalAlign: 'middle',borderWidth: 0},"+
					"credits: {enabled: false},"+
					"series: [{ name: '상권', data: ["+values1+"]},{name: '배후지',data: ["+values2+"]}]"+
					"});";
		return line;
	}
	
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
	
	public String getBar(String[] barText, String[] xName, String[] code, HashMap<String, String> frontRecentRow, HashMap<String, String> backRecentRow){
		String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(backRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
		long value1 = 0;
		long value2 = 0;
		String values1 = "";
		String values2 = "";
		Double cut = Double.parseDouble(barText[4]);
		
		for (int i = 0; i < xName.length; i++) {
			if(!String.valueOf(frontRecentRow.get(code[i])).equals("null")){
				value1 = Long.parseLong(String.valueOf(frontRecentRow.get(code[i])));
			}else{
				value1 = 0;
			}
			
			if(!String.valueOf(backRecentRow.get(code[i])).equals("null")){
				value2 = Long.parseLong(String.valueOf(backRecentRow.get(code[i])));
			}else{
				value2 = 0;
			}

			if(i==0){
				values1 += "['"+xName[i]+"',"+(int)(value1/cut)+"]";
				values2 += "['"+xName[i]+"',"+(int)(value2/cut)+"]";
			}else{
				values1 += ",['"+xName[i]+"',"+(int)(value1/cut)+"]";
				values2 += ",['"+xName[i]+"',"+(int)(value2/cut)+"]";

			}
		}
		
		String bar = "\n$('."+barText[0]+"').highcharts(" + 
				"{chart: {type: 'column'}," + 
				"title: {text: '"+ barText[1]+"("+recentDate+"기준)'}," + 
				"xAxis: {type: 'category',labels: {rotation: -45,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}}," +
				"yAxis: {min: 0,title: {text: '"+barText[2]+"'}}," +
		        "legend: {enabled: true}," +
		        "tooltip: {pointFormat: '"+ recentDate +" <br><b>{point.y:.0f}</b> "+ barText[3] +"'},"+
		        "series: [{name: '상권', data: ["+ values1 +"],dataLabels: {enabled: true,rotation: 0,color: '#FFFFFF',align: 'center',format: '{point.y:.0f}', y: 50,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}},"
		        		+ "{name: '배후지', data: ["+ values2 +"],dataLabels: {enabled: true,rotation: 0,color: '#FFFFFF',align: 'center',format: '{point.y:.0f}', y: 50,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}}]});";	
		return bar;
	}
	
	public String getBar2(String[] barText,  ArrayList<HashMap> front, ArrayList<HashMap> back){
		String recentDate = String.valueOf(front.get(0).get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(front.get(0).get("기준_년월_코드")).substring(4, 6) + "월";
		long value1 = 0;
		long value2 = 0;
		String values1 = "";
		String values2 = "";
		String[] xName = null;
		String[] code = null;
		switch(barText[5].substring(0, 3)){
		case "CS1" : xName = new String[]{"한식음식점","중국집","일식집","양식집","분식집","패스트푸드점","치킨집","제과점","커피음료","호프간이주점"}; 
					code = new String[]{"CS100001","CS100002","CS100003","CS100004","CS100005","CS100006","CS100007","CS100008","CS100009","CS100010"};break;
		case "CS2" : xName = new String[]{"입시보습학원","외국어학원","예체능학원","치과의원","한의원","일반의원","보육시설","부동산중개업","인테리어","노래방","PC방","당구장","골프연습장","헬스클럽","노인요양시설","미용실","네일숍","피부관리실","여관업","세탁소","자동차수리","자동차미용"}; 
					code = new String[]{"CS200001","CS200002","CS200003","CS200004","CS200005","CS200006","CS200007","CS200008","CS200009","CS200010","CS200011","CS200012","CS200013","CS200014","CS200015","CS200016","CS200017","CS200018","CS200019","CS200020","CS200021","CS200022"};break;
		case "CS3" : xName = new String[]{"슈퍼마켓","편의점","컴퓨터판매수리","휴대폰","정육점","과일채소","의류점","패션잡화","약국","문구점","화장품"}; 
					code = new String[]{"CS300001","CS300002","CS300003","CS300004","CS300005","CS300006","CS300007","CS300008","CS300009","CS300010","CS300011"}; break;
		}
		
		
		Double cut = Double.parseDouble(barText[4]);

		for (int i = 0; i < front.size(); i++) {
			for (int j = 0; j < code.length; j++) {
				if(String.valueOf(front.get(i).get("서비스_업종_코드")).equals(code[j])){

					if(!String.valueOf(front.get(i).get(barText[6])).equals("null")){
						value1 = Long.parseLong(String.valueOf(front.get(i).get(barText[6])));						
					}else{
						value1 = 0;
					}
					
					if(!String.valueOf(back.get(i).get(barText[6])).equals("null")){
						value2 = Long.parseLong(String.valueOf(back.get(i).get(barText[6])));
					}else{
						value2 = 0;
					}
					
					if(i==0){
						values1 += "['"+xName[j]+"',"+(int)(value1/cut)+"]";
						values2 += "['"+xName[j]+"',"+(int)(value2/cut)+"]";
					}else{
						values1 += ",['"+xName[j]+"',"+(int)(value1/cut)+"]";
						values2 += ",['"+xName[j]+"',"+(int)(value2/cut)+"]";
					}
				}
			}
			
		}
		
		String bar = "\n$('."+barText[0]+"').highcharts(" + 
				"{chart: {type: 'column'}," + 
				"title: {text: '"+ barText[1]+"("+recentDate+"기준)'}," + 
				"xAxis: {type: 'category',labels: {rotation: -45,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}}," +
				"yAxis: {min: 0,title: {text: '"+barText[2]+"'}}," +
		        "legend: {enabled: true}," +
		        "tooltip: {pointFormat: '"+ recentDate +" <br><b>{point.y:.0f}</b> "+ barText[3] +"'},"+
		        "series: [{name: '상권', data: ["+ values1 +"],dataLabels: {enabled: true,rotation: 0,color: '#FFFFFF',align: 'center',format: '{point.y:.0f}', y: 50,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}},"
		        		+ "{name: '배후지', data: ["+ values2 +"],dataLabels: {enabled: true,rotation: 0,color: '#FFFFFF',align: 'center',format: '{point.y:.0f}', y: 50,style: {fontSize: '13px',fontFamily: 'Verdana, sans-serif'}}}]});";	
		return bar;
	}
}
