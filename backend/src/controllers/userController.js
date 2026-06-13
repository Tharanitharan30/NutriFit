const User = require("../models/User");
exports.updateProfile = async (req,res)=>{
    try{
  
      const {
        age,
        gender,
        height,
        weight,
        activityLevel
      } = req.body;
  
      const user = await User.findByIdAndUpdate(
        req.user.id,
        {
          age,
          gender,
          height,
          weight,
          activityLevel
        },
        { new:true }
      );
  
      res.json(user);
  
    }catch(error){
      res.status(500).json({
        error:error.message
      });
    }
  };
  exports.getProfile = async (req,res)=>{
    try{
  
      const user = await User.findById(
        req.user.id
      ).select("-password");
  
      res.json(user);
  
    }catch(error){
      res.status(500).json({
        error:error.message
      });
    }
  };