import React, { useEffect, useState } from "react";
import logo from "./logo.svg";
import "./App.css";
import { styled } from '@mui/material/styles';
import  axios  from "axios";


let data:any;

function App() {
  data = useEffect(() => {
    axios.get("http://localhost:8000/orders")
    .then(res => console.log(res.data)
    ).catch(err => console.log(err)
    )
  }, [])

  return (
    <div style={{ height: 300, width: '50%' }}>
      <table>
        
      </table>
    </div>
    
    
  );
}
export default App;