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


   
    struct MyToken has key{
      signer_cap: account::SignerCapability,
      admin_addr:address,
      minting_enabled:bool,
      minted_supply:u64,
      mint_price:u64,
      token_minting_events:event::EventHandle<TokenMintingEvent>
    }

    fun assert_is_admin(addr:address)acquires MyToken{
      let admin= borrow_global<MyToken>(@my_token).admin_addr;
    assert!(addr == admin, error::permission_denied(ENOT_ADMIN));
    }

    fun init_module(resource_acc:&signer){


     let signer_cap= resource_account::retrieve_resource_account_cap(resource_acc, @my_token); 

     move_to(resource_acc,MyToken{
        signer_cap,
        admin_addr:@my_token,
        minting_enabled:true,
        minted_supply:0,
        mint_price:20000000,
        token_minting_events:account::new_event_handle<TokenMintingEvent>(resource_acc), 
     });
    }

    public entry fun issue_collection(creator:&signer)acquires MyToken{}

}