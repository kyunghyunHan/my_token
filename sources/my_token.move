module my_token::minting{
       use std::error;
       use std::signer;
       use std::string;
       use std::vector;
       use std::apts_coin::AptosCoin;
       use aptos_token::token;
    use aptos_framework::account;
    use aptos_framework::coin;
    use aptos_framework::event;
    use aptos_framework::resource_account;

    //Errors
   const ENOT_ADMIN:u64= 0;
   const EMINTING_DISABLED:u64= 1;
   const ENO_SUFFICIENT_FUND:u64= 2;

   // Constants
    const COLLECTION_NAME: vector<u8> = b"Pepes";
    const COLLECTION_URI: vector<u8> = b"https://ibb.co/t3ckz86";
    const COLLECTION_SUPPLY: u64 = 0;
    const TOKEN_NAME: vector<u8> = b"Pepe #";
    const TOKEN_URI: vector<u8> = b"ipfs://bafybeihnochxvsv6h43qvg4snenpeasoml66nwxhuiadfzkefix7vbetyq/";
    const TOKEN_SUPPLY: u64 = 1;
    const DESCRIPTION: vector<u8> = b"";


     

       struct TokenMintingEvent has drop, store {
        buyer_addr: address,
        token_data_id: vector<token::TokenDataId>,
    }
       struct MyToken has store{

        name:vector<u8>,
        token_data:token::TokenDataId
       }

    
}