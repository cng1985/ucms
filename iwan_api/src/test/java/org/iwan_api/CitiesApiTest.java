package org.iwan_api;

import com.tongna.shopdeals.api.CityApi;
import com.tongna.shopdeals.api.impl.CityApiImpl;
import com.tongna.shopdeals.domain.Cities;
import com.tongna.shopdeals.domain.CitiesListBack;
import org.junit.Test;

import java.util.List;

/**
 * Created by ada on 2016/10/25.
 */
public class CitiesApiTest {

    @Test
    public  void testCitys(){
        CityApi api = new CityApiImpl();
        CitiesListBack back = api.findAll();
        List<Cities> city = back.getCities();
        System.out.println(city.size());
    }
}
