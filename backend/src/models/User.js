const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name:{
    type:String,
    required:true
  },

  email:{
    type:String,
    required:true,
    unique:true
  },

  password:{
    type:String,
    required:true
  },

  age:{
    type:Number,
    default:null
  },

  gender:{
    type:String,
    enum:["male","female"],
    default:null
  },

  height:{
    type:Number,
    default:null
  },

  weight:{
    type:Number,
    default:null
  },

  activityLevel:{
    type:String,
    enum:[
      "sedentary",
      "light",
      "moderate",
      "active",
      "very_active"
    ],
    default:null
  }
},{
  timestamps:true
});

module.exports = mongoose.model("User",userSchema);