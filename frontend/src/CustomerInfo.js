import React, { useState } from 'react';
import axios from 'axios';

axios.defaults.baseURL = 'http://localhost:3000';

const CustomerInfo = () => {
  const [customerId, setCustomerId] = useState('');
  const [customerInfo, setCustomerInfo] = useState(null);

  const fetchCustomerInfo = async () => {
    console.log('Button clicked, fetching customer info for ID:', customerId);
    try {
      const response = await axios.get(`/api/customer/${customerId}`);
      console.log('Customer info retrieved:', response.data);
      setCustomerInfo(response.data);
    } catch (error) {
      console.error('Error fetching customer info:', error);
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
          <p>ID: {customerInfo.id}</p>
          <p>Name: {customerInfo.name}</p>
        </div>
      )}
    </div>
  );
};

export default CustomerInfo;
