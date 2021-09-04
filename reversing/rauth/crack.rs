use salsa20::{Salsa20, Key, Nonce};
use salsa20::cipher::{NewCipher, StreamCipher, StreamCipherSeek};

fn main() {
    let mut data =[ 0x5, 0x5, 0x5F ,0x0B1,0x0A3, 0x29 ,
    0x0A8,0x0D5, 0x58 ,0x0D9,0x0F5, 0x56 ,0x0A6,0x0CB, 0x31, 
    0x0F3, 0x24, 0x43 , 0x2A , 0x31 ,0x0C9, 0x9D,0x0EC, 0x72 ,0x0E3,
    0x3E ,0x0B6, 0x6F , 0x62 ,0x0AD, 0x1B,0x0F9];

    let key = Key::from_slice(b"ef39f4f20e76e33bd25f4db338e81b10");
    let nonce = Nonce::from_slice(b"d4c270a3");
    
    let mut password = String::new();

    // create cipher instance
    let mut cipher = Salsa20::new(&key, &nonce);
    
    // apply keystream (encrypt)
    cipher.seek(0);
    cipher.apply_keystream(&mut data);
    for i in data.iter(){
        password.push(*i as char);
    }

    println!("Password is {}",password);
    
    
}

