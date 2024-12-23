using Godot;
using System;

// Copyright 2024 Fifth Circle Studios -  Jordan Pryor

public partial class camController : Node3D
{
	Node3D rotaGizmo; 
	SpringArm3D camArm;
	Camera3D camera;

	[Export] Vector3 camOffset = new Vector3(-1, 0.5f, -1);
	[Export] bool invertX = false;
	[Export] bool invertY = false;
	[Export] float mouseSensitivity = 6f;
	[Export] float clampUpAt = 45;
	[Export] float clampDownAt = 20;

	Vector2 mouseInput;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		rotationGizmo = GetNode<Node3D>("RotationGizmo");
		camArm = rotationGizmo.GetNode<SpringArm3D>("camArm");
		camera = camArm.GetNode<Camera3D>("Camera");
		camera.Current = true;
		camArm.Position = camOffset;
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
