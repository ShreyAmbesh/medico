pragma solidity ^0.5.0;

contract SupplyChainMedicoContract{

   //standalones
   address buyer;
   address seller;

   //mappings
   mapping(address => address) buyerSellerMapping;

   //Supply Chain Stages
   enum Stages{
       RequestForMedicine,
       RequestApproved,
       Dispatched,
       Shipping,
       DeliveredToWareHouse,
       DeliveryComplete,
       Done
   }

   //Stage initalization
   Stages public stage;

   //modifiers
   modifier atStage(Stages _stage){
       require(stage == _stage);
       _;
   }

   modifier transitionNext() {
       _;
       stage = Stages(uint(stage) + 1);
   }

   modifier isSeller(){
       require(msg.sender == seller);
       _;
   }

   modifier isBuyer(){
       require(msg.sender == buyer);
       _;
   }


   //Return Stages
   function getStage() public view returns(string memory){
       if(uint(stage) == 0){
           return ("RequestForMedicine");
       }
       if(uint(stage) == 1){
           return ("RequestApproved");
       }
       if(uint(stage) == 2){
           return ("Dispatched");
       }
       if(uint(stage) == 3){
           return ("Shipping");
       }
       if(uint(stage) == 4){
           return ("DeliveredToWareHouse");
       }
       if(uint(stage) == 5){
           return ("DeliveryComplete");
       }
       if(uint(stage) == 6){
           return ("Done");
       }
   }


   //Callable State Changes
   function requestForMedicine()
   atStage(Stages.RequestForMedicine)
   isBuyer
   transitionNext
   public {}

   function requestApproved()
   atStage(Stages.RequestApproved)
   isSeller
   transitionNext
   public {}

   function dispatched()
   atStage(Stages.Dispatched)
   isSeller
   transitionNext
   public {}

   function shipping()
   atStage(Stages.Shipping)
   isSeller
   transitionNext
   public {}

   function deliverToWarehouse()
   atStage(Stages.DeliveredToWareHouse)
   isSeller
   transitionNext
   public {}

   function complete()
   atStage(Stages.DeliveryComplete)
   isBuyer
   transitionNext
   public {}


   //Contract Intializer
   function start(address _seller) public{
       buyerSellerMapping[msg.sender] = _seller;
       buyer = msg.sender;
       seller = _seller;
   }

}