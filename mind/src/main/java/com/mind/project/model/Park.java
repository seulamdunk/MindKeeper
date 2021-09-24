package com.mind.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="park")
public class Park {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int park_Num;
		
		@Column
		private String park_Name;
		
		@Column
		private float park_Wido;
		
		@Column
		private float park_Gyungdo;
		
		@Builder
		public Park(String park_Name, float park_Wido, float park_Gyungdo) {
			this.park_Name = park_Name;
			this.park_Wido = park_Wido;
			this.park_Gyungdo = park_Gyungdo;
		}
		
		
		
}
