import React, { useState } from 'react';
import axios from 'axios';

const API_URL = 'http://localhost:8080/api';

const CustomerInfo = () => {
  const [customerId, setCustomerId] = useState('');
  const [customerInfo, setCustomerInfo] = useState(null);

  const fetchCustomerInfo = async () => {
    console.log('Button clicked, fetching customer info for ID:', customerId);
    try {
      const response = await axios.get(`${API_URL}/customer/${customerId}`);
      console.log('Customer info retrieved:', response.data);
      setCustomerInfo(response.data);
    } catch (error) {
      console.error('Error fetching customer info:', error);
    }
  };

  const loadInitialData = async () => {
    console.log('Button clicked, loading initial data');
    try {
      await axios.post(`${API_URL}/data/load`);
      console.log('Initial data loaded successfully');
    } catch (error) {
      console.error('Error loading initial data:', error);
    }
  };

  return (
    <div>
      <h1>Retrieve Customer Information</h1>
      <input
        type="text"
        value={customerId}
        onChange={(e) => setCustomerId(e.target.value)}
        placeholder="Enter Customer ID"
      />
      <button onClick={fetchCustomerInfo}>Get Customer Info</button>
      {customerInfo && (
        <div>
          <h2>Customer Information</h2>
          <p>{customerInfo}</p>
        </div>
      )}
      <button onClick={loadInitialData}>Load Initial Data</button>
    </div>
  );
};

export default CustomerInfo;
