package com.quhaodian.ucms.data;

import org.junit.Test;

import java.util.List;

import static org.mockito.Mockito.*;

public class MockTest {

    @Test
    public void testMock() {

        List mockedList = mock(List.class);

// using mock object - it does not throw any "unexpected interaction" exception
       mockedList.add("one");
        mockedList.clear();

// selective, explicit, highly requhaodianble verification
        verify(mockedList).add("one");
        verify(mockedList).clear();
    }
}
