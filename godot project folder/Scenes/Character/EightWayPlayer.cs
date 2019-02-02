using Godot;
using System;

public class EightWayPlayer : KinematicBody2D
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
			Rotation = 1.5708f;			
			
        }
        if (Input.IsActionPressed("left"))
        {   
			
            velocity.x -= 1;
			Rotation = 4.71239f;
			
        }
        if (Input.IsActionPressed("down"))
        {
            
			velocity.y += 1;
			Rotation = 3.14159f;
			if (Input.IsActionPressed("right"))
        	{   
            	velocity.x += 1;
			    Rotation = 2.35619f;
			
        	}
        	if (Input.IsActionPressed("left"))
        	{   
			
            	velocity.x -= 1;
				Rotation= 3.92699f;
        	}
			
        }
        if (Input.IsActionPressed("up"))
        {
            
			velocity.y -= 1;
			Rotation = 0;
			if (Input.IsActionPressed("right"))
        	{   
            	velocity.x += 1;
			    Rotation = 0.785398f;
			
        	}
        	if (Input.IsActionPressed("left"))
        	{   
			
            	velocity.x -= 1;
				Rotation= 5.49779f;
        	}
			
        }

        velocity = velocity.Normalized() * Speed;
		LookAt(GetGlobalMousePosition());
    }

    public override void _PhysicsProcess(float delta)
    {
        GetInput();
        MoveAndSlide(velocity);
		
	}
}
