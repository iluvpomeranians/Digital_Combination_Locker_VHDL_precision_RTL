--David Martinez
--29556869
--Winter 2022 COEN 313: Project


Library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;
    
ENTITY combo_lock_mech IS
        PORT ( 
               ld0   : IN STD_LOGIC := '0';
               ld1   : IN STD_LOGIC := '0';
               ld2   : IN STD_LOGIC := '0';                
               value : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
               enter : IN STD_LOGIC;
               reset : IN STD_LOGIC;
               clock : IN STD_LOGIC;
               unlock : Out STD_LOGIC
            );
END ENTITY;


ARCHITECTURE rtl of combo_lock_mech is    

    type three_digit_lock is array (0 to 2) of std_logic_vector(3 downto 0); 
                             signal key_pad : three_digit_lock;
    
    type secret_code is array (0 to 2) of std_logic_vector(3 downto 0); 
                                signal code : secret_code;       
    
    type state_type is (idle, load0, load1, load2);
    attribute enum_encoding                 : string;
    attribute enum_encoding of state_type   : type is "00 01 10 11"; 
    signal state_reg, state_next            : state_type;          

                BEGIN

                code(0)    <= "0111";
                code(1)    <= "0101";
                code(2)    <= "1001";

--//////////////--
--State Register--
--//////////////--
controller:  process(clock, reset) 
                
                BEGIN            


    
                if (reset = '1') then
                       state_reg <= idle; 
                elsif (clock'event and clock = '1') then
                       state_reg <= state_next;                                         
                                                    
                end if;              
                 
                                      
                END process controller;


--////////////////--
--Next State Logic--
--////////////////--
load_states:    process(state_reg, enter, ld0, ld1, ld2)

 
                BEGIN                
                
                case state_reg is
                    
                    when idle => 
             
                     if(reset = '0') then
                       if(enter = '1') then
                            if((ld0 = '1') and (ld1 = '0') and (ld2 = '0')) then
                                state_next <= load0;
                            elsif((ld0 = '0') and (ld1 = '1') and (ld2 = '0')) then
                                state_next <= load1;
                            elsif((ld0 = '0') and (ld1 = '0') and (ld2 = '1')) then
                                state_next <= load2;
                            else state_next <= idle;
                            end if;
                       end if;
                     end if;
                     
                       
                    
                    when load0 =>
            
                        if(enter = '1') then
                            if((ld0 = '1') and (ld1 = '0') and (ld2 = '0')) then
                                state_next <= load0;
                            elsif((ld0 = '0') and (ld1 = '1') and (ld2 = '0')) then
                                state_next <= load1;
                            elsif((ld0 = '0') and (ld1 = '0') and (ld2 = '1')) then
                                state_next <= load2;
                            else state_next <= idle;
                            end if;
                       end if;

                    
                    when load1 =>

                        if(enter = '1') then
                            if((ld0 = '1') and (ld1 = '0') and (ld2 = '0')) then
                                state_next <= load0;
                            elsif((ld0 = '0') and (ld1 = '1') and (ld2 = '0')) then
                                state_next <= load1;
                            elsif((ld0 = '0') and (ld1 = '0') and (ld2 = '1')) then
                                state_next <= load2;
                            else state_next <= idle;
                            end if;
                       end if;
                        
                    
                    when load2 => 
                    
                        if(enter = '1') then
                            if((ld0 = '1') and (ld1 = '0') and (ld2 = '0')) then
                                state_next <= load0;
                            elsif((ld0 = '0') and (ld1 = '1') and (ld2 = '0')) then
                                state_next <= load1;
                            elsif((ld0 = '0') and (ld1 = '0') and (ld2 = '1')) then
                                state_next <= load2;
                            else state_next <= idle;
                            end if;
                       end if;


                    when others => state_next <= idle;

                                                                       
                
                 end case;

                END process load_states;

--/////////--
--Data Path--
--/////////--
mux_control:    process(state_next)


                BEGIN
              
                                                
                case state_next is
                    when load0 => key_pad(0) <= value;
                    when load1 => key_pad(1) <= value;
                    when load2 => key_pad(2) <= value;

                when others =>
                
                end case;
                
                END process mux_control;
                    
--//////////////////--
--Moore Output Logic--
--//////////////////--
comparator:     process(key_pad)

                BEGIN
                
                if(reset = '0') then

                if( (code(0) = key_pad(0)) and (code(1) = key_pad(1)) and (code(2) = key_pad(2)) ) then
                    unlock <= '1';
                else
                    unlock <= '0';

                end if;

                else
                    unlock <= '0';
                    
                end if;                

                END process comparator;



END rtl;
