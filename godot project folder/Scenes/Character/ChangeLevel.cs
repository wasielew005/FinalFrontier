using Godot;
using System;

public class ChangeLevel : Area2D
{
    // Member variables here, example:
    // private int a = 2;
    // private string b = "textvar";
public void OverlapsBody(EightWayPlayer body){
GetTree().ChangeScene("res://Scenes/kylerstestarea.tscn");
}
    public override void _Ready()
    {
        
        // Called every time the node is added to the scene.
        // Initialization here
        
    }

    
    
//    public override void _Process(float delta)
//    {
//        // Called every frame. Delta is time since last frame.
//        // Update game logic here.
//        
//    }
}
