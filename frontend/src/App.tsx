import React, { useEffect, useState } from "react";
import logo from "./logo.svg";
import "./App.css";
import  Button  from "@mui/material/Button";
import { styled } from '@mui/material/styles';
import { DataGrid, GridRowsProp, GridColDef } from '@mui/x-data-grid';
import { Router } from "@mui/icons-material";
let id = 0
function returnId(){
    id++
    return id;
}
const rows: GridRowsProp = [
  { id: returnId(), col1: "", col2: "" },
  { id: returnId(), col1: "", col2: "" },
  { id: returnId(), col1: "", col2: "" },
];

const columns: GridColDef[] = [
  { field: 'name', headerName: 'Name', width: 150, editable:true},
  { field: 'pizza', headerName: 'Pizza', width: 150, editable:true },
]
export default function App() {
  return (
    <div style={{ height: 300, width: '50%' }}>
      <DataGrid rows={rows} columns={columns} />
      <iframe width="100%" height="500px" src="https://replit.com/@Raphi-2Code/Chess-Game-Tkinter-en-passant-working?embed=true"></iframe>

    </div>
    
    
  );
}