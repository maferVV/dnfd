if(state_new)
{
    draw_dice_info = false;
    with(dice1){ dice_toss(); }
    with(dice2){ dice_toss(); }
}



if((dice1.ready) && (dice2.ready))
{
    state_switch("diceCheckFinish");
}
