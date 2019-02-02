using Godot;
using System;
//4 direction movement
public class player : KinematicBody2D
{
    [Export] public int Speed = 50;

    Vector2 velocity = new Vector2();
	
	int counter = 0;
	

    public void GetInput()
    {   //prite = GetNode("sprite");
        velocity = new Vector2();
        if (Input.IsActionPressed("right"))
        {   
            velocity.x += 1;
			
			
        }
        else if (Input.IsActionPressed("left"))
        {   
			
            velocity.x -= 1;
			
        }
        else if (Input.IsActionPressed("down"))
        {
            
			velocity.y += 1;
			
        }
        else if (Input.IsActionPressed("up"))
        {
            
			velocity.y -= 1;
			
        }
		else if (Input.IsActionPressed("right") && Input.IsActionPressed("up"))
        {   
			
            velocity.x += 1;
			velocity.y -= 1;
			
        }
        else if (Input.IsActionPressed("down") && Input.IsActionPressed("right"))
        {
            
			velocity.y += 1;
			velocity.x += 1;
			
        }
        else if (Input.IsActionPressed("down") && Input.IsActionPressed("left"))
        {
            
			velocity.x -= 1;
			velocity.y += 1;
			
        }
		else if (Input.IsActionPressed("up") && Input.IsActionPressed("left")){
		    velocity.x -= 1;
			velocity.y -= 1;
		}
        velocity = velocity.Normalized() * Speed;
    }

    public override void _PhysicsProcess(float delta)
    {
        GetInput();
        MoveAndSlide(velocity);
		
	}
}