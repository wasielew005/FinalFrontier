using Godot;
using System;

public class EightWayPlayer : KinematicBody2D
{
    [Export] public int Speed = 250;

    Vector2 velocity = new Vector2();
	Vector2 pos = new Vector2();
	
	int counter = 0;
	

    public void GetInput()
    {   //prite = GetNode("sprite");
        velocity = new Vector2();
		
        if (Input.IsActionPressed("right"))
        {   counter+=1;
            velocity.x += 1;
			/*if(GetViewport().GetMousePosition().x>0)
			{ 
			 	LookAt(GetViewport().GetMousePosition());
			} 
			else 
			{
				LookAt(new Vector2((-GetViewport().GetMousePosition().x), GetViewport().GetMousePosition().y));
			//
			}*/
			Rotation = 1.5708f;
			if (counter <= 5)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(0); 
			}
			else if (counter <=10)
			{
				((Sprite)GetNode("sprite")).SetFrame(1); 
			}
			else if (counter <= 15)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(2);
			}
			else if (counter <= 19)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(3);
					
			}
			else if (counter == 20)
			{
				((Sprite)GetNode("sprite")).SetFrame(3);
				counter=0;
			}			
			
        }
        if (Input.IsActionPressed("left"))
        {   
			counter+=1;
            velocity.x -= 1;
			Rotation = 4.71239f;
			if (counter <= 5)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(0); 
			}
			else if (counter <=10)
			{
				((Sprite)GetNode("sprite")).SetFrame(1); 
			}
			else if (counter <= 15)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(2);
			}
			else if (counter <= 19)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(3);
					
			}
			else if (counter == 20)
			{
				((Sprite)GetNode("sprite")).SetFrame(3);
				counter=0;
			}
        }
        if (Input.IsActionPressed("down"))
        {
            counter+=1;
			velocity.y += 1;
			Rotation = 3.14159f;
			if (counter <= 5)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(0); 
			}
			else if (counter <=10)
			{
				((Sprite)GetNode("sprite")).SetFrame(1); 
			}
			else if (counter <= 15)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(2);
			}
			else if (counter <= 19)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(3);
					
			}
			else if (counter == 20)
			{
				((Sprite)GetNode("sprite")).SetFrame(3);
				counter=0;
			}
			
			if (Input.IsActionPressed("right"))
        	{   //counter+=1;
            	velocity.x += 1;
			    Rotation = 2.35619f;
				
        	}
        	if (Input.IsActionPressed("left"))
        	{   
			    //counter+=1;
            	velocity.x -= 1;
				Rotation= 3.92699f;
				
        	}
			
        }
        if (Input.IsActionPressed("up"))
        {
            counter+=1;
			velocity.y -= 1;
			Rotation = 0;
			if (counter <= 5)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(0); 
			}
			else if (counter <=10)
			{
				((Sprite)GetNode("sprite")).SetFrame(1); 
			}
			else if (counter <= 15)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(2);
			}
			else if (counter <= 19)
			{ 
				((Sprite)GetNode("sprite")).SetFrame(3);
					
			}
			else if (counter == 20)
			{
				((Sprite)GetNode("sprite")).SetFrame(3);
				counter=0;
			}
			if (Input.IsActionPressed("right"))
        	{   
				//counter+=1;
            	velocity.x += 1;
			    Rotation = 0.785398f;
				
        	}
        	if (Input.IsActionPressed("left"))
        	{   
				//counter+=1;
            	velocity.x -= 1;
				Rotation= 5.49779f;
				
        	}
			
        }

        velocity = velocity.Normalized() * Speed;
		pos.x = Position.x;
		pos.y = Position.y - (2*Position.y);
		//Rotation = -1* GetGlobalMousePosition().AngleTo(Position);
		if(velocity.x == 0 && velocity.y == 0)
		{
			((Sprite)GetNode("sprite")).SetFrame(0);
		}	
		
		
    }

    public override void _PhysicsProcess(float delta)
    {
        GetInput();
        MoveAndSlide(velocity);
		
	}
}
