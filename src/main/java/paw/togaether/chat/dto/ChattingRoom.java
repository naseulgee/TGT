package paw.togaether.chat.dto;

import java.util.LinkedList;
import java.util.Objects;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChattingRoom {
	private String roomNumber;
	private String roomName;
	private LinkedList<String> users;

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChattingRoom other = (ChattingRoom) obj;
		return Objects.equals(roomNumber, other.roomNumber);
	}

	@Override
	public int hashCode() {
		return Objects.hash(roomNumber);
	}
}