module my_token::minting{
       use std::signer;
       use aptos_token::token;


       struct MyToken has store{

        name:vector<u8>,
        token_data:token::TokenDataId
       }
    
}