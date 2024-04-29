if(state_next != state)
{
  state=state_next;
  state_timer=0;
  state_new=true;
}
else
{
  //state_timer++;
  state_timer += global.tmc_dt_delta_t * room_speed; //tmc_dt
  state_new=false;
}
