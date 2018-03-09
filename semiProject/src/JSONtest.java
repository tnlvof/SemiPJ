

import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.TreeSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JSONtest {

	public static void main(String[] args) {
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(new FileReader(JSONtest.class.getResource("/jsonFile/2.json").getPath()));
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		JSONObject jObj = (JSONObject)obj;
		JSONObject jObj2 = (JSONObject) jObj.get("DESCRIPTION");
		JSONArray jArr1 = (JSONArray) jObj.get("DATA");
		
		Iterator i = jObj.keySet().iterator();
		Iterator i2 = jObj2.keySet().iterator();
		JSONObject jObj3 = (JSONObject) jArr1.get(8);
		//Iterator i3 = jObj3.keySet().iterator();
		TreeSet ts =new TreeSet();
		ts.addAll(jObj3.keySet());
		Iterator i3=ts.iterator();
		//System.out.println(jObj2);
		//System.out.println(jObj2.get("FAG_30_THUTM_2_FLPOP_CO"));
				
		while(i3.hasNext()){
			String engKey = (String) i3.next();
			String korKey = (String) jObj2.get(engKey.toUpperCase());
			System.out.println("engKey : " + engKey + ", korKey : " + korKey + ", value : " + jObj3.get(engKey));
			//System.out.println(engKey + " " + korKey);
		}
			
	}

}
