package com.mind.project.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Getter
@Entity
@Table(name = "youtube")
public class Youtube {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="YOUTUBE_NUM")
	private int youtubeNum;

	@Column
	private String youtubeTitle;
	@Column
	private String youtubeCh;
	@Column
	private String youtubeTag;
	@Column
	private String youtubeUrl;
	@Column
	private int youtubeCnt = 0;
	@Column
	private String thumbnail;
	
	
	

	@Builder
	public Youtube(int youtubeNum, String youtubeTitle, String youtubeCh, String youtubeTag, String youtubeUrl,
			int youtubeCnt, String thumbnail) {

		this.youtubeNum = youtubeNum;
		this.youtubeTitle = youtubeTitle;
		this.youtubeCh = youtubeCh;
		this.youtubeTag = youtubeTag;
		this.youtubeUrl = youtubeUrl;
		this.youtubeCnt = youtubeCnt;
		this.thumbnail = thumbnail;
	}



}
