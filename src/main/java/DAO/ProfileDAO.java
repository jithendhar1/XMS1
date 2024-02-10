package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import beans.AddProfile;
import utility.DBUtil;

public class ProfileDAO {

	private static final Logger logger = Logger.getLogger(ProfileDAO.class.getName());

	public List<AddProfile> getAllProfiles() {
		List<AddProfile> profileList = new ArrayList<>();
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						/*
						 * userID, username, email, password, phno, firstname, lastname, RoleID,
						 * ReferrerUsername
						 */
						"SELECT userID, username, email,password, phno, firstname, lastname, RoleID,ReferrerUsername FROM users");
				ResultSet resultSet = preparedStatement.executeQuery()) {

			while (resultSet.next()) {
				AddProfile profile = new AddProfile();
				profile.setId(resultSet.getString("id"));
				profile.setFirstName(resultSet.getString("firstName"));
				profile.setLastName(resultSet.getString("lastName"));
				profile.setGender(resultSet.getString("gender"));
				profile.setAddress(resultSet.getString("address"));
				profile.setState(resultSet.getString("state"));
				profile.setCountry(resultSet.getString("country"));
				profile.setPinCode(resultSet.getString("pinCode"));
				profile.setPhoneNumber(resultSet.getString("phoneNumber"));
				profileList.add(profile);
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error fetching all profiles", e);
		}
		return profileList;
	}

	public AddProfile getProfileById(String profileId) {
		AddProfile profile = null;
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT id, firstName, lastName, gender, address, state, country, pinCode, phoneNumber FROM profile WHERE id = ?")) {

			preparedStatement.setString(1, profileId);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					profile = new AddProfile();
					profile.setId(resultSet.getString("id"));
					profile.setFirstName(resultSet.getString("firstName"));
					profile.setLastName(resultSet.getString("lastName"));
					profile.setGender(resultSet.getString("gender"));
					profile.setAddress(resultSet.getString("address"));
					profile.setState(resultSet.getString("state"));
					profile.setCountry(resultSet.getString("country"));
					profile.setPinCode(resultSet.getString("pinCode"));
					profile.setPhoneNumber(resultSet.getString("phoneNumber"));
				}
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error fetching profile by ID", e);
		}
		return profile;
	}

	public AddProfile getProfileByUserName(String username) {
		AddProfile profile = null;
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(

						"SELECT UserId, FirstName, LastName, UserName, Email, phno FROM users WHERE username = ?")) {

			preparedStatement.setString(1, username);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					profile = new AddProfile();
					profile.setId(resultSet.getString("UserId"));
					profile.setFirstName(resultSet.getString("FirstName"));
					profile.setLastName(resultSet.getString("LastName"));
					profile.setUsername(resultSet.getString("UserName"));
					profile.setEmail(resultSet.getString("Email"));
					profile.setPhoneNumber(resultSet.getString("phno"));
				}
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error fetching profile by ID", e);
		}
		return profile;
	}

	public boolean addProfile(AddProfile profile) {
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"INSERT INTO profile (id, firstName, lastName, gender, address, state, country, pinCode, phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

			preparedStatement.setString(1, profile.getId());
			preparedStatement.setString(2, profile.getFirstName());
			preparedStatement.setString(3, profile.getLastName());
			preparedStatement.setString(4, profile.getGender());
			preparedStatement.setString(5, profile.getAddress());
			preparedStatement.setString(6, profile.getState());
			preparedStatement.setString(7, profile.getCountry());
			preparedStatement.setString(8, profile.getPinCode());
			preparedStatement.setString(9, profile.getPhoneNumber());

			int rowsInserted = preparedStatement.executeUpdate();
			return rowsInserted > 0;

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error adding profile", e);
			return false;
		}
	}

	public boolean updateProfile(AddProfile profile) {
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE profile SET firstName = ?, lastName = ?, gender = ?, address = ?, state = ?, country = ?, pinCode = ?, phoneNumber = ? WHERE id = ?")) {

			preparedStatement.setString(1, profile.getFirstName());
			preparedStatement.setString(2, profile.getLastName());
			preparedStatement.setString(3, profile.getGender());
			preparedStatement.setString(4, profile.getAddress());
			preparedStatement.setString(5, profile.getState());
			preparedStatement.setString(6, profile.getCountry());
			preparedStatement.setString(7, profile.getPinCode());
			preparedStatement.setString(8, profile.getPhoneNumber());
			preparedStatement.setString(9, profile.getId());

			int rowsUpdated = preparedStatement.executeUpdate();
			return rowsUpdated > 0;

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error updating profile", e);
			return false;
		}
	}

	public boolean updateProfileDetails(AddProfile profile) {
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"UPDATE users SET FirstName = ?, LastName = ?, UserName = ?, Email = ?, phno = ?  WHERE UserName = ?")) {
			preparedStatement.setString(1, profile.getFirstName());
			preparedStatement.setString(2, profile.getLastName());
			preparedStatement.setString(3, profile.getUsername());
			preparedStatement.setString(4, profile.getEmail());
			preparedStatement.setString(5, profile.getPhoneNumber());			
			preparedStatement.setString(6, profile.getUsername());
			int rowsUpdated = preparedStatement.executeUpdate();
			return rowsUpdated > 0;
		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error updating profile", e);
			return false;
		}
	}
	public boolean deleteProfile(String profileId) {
		try (Connection connection = DBUtil.provideConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM profile WHERE id = ?")) {

			preparedStatement.setString(1, profileId);

			int rowsDeleted = preparedStatement.executeUpdate();
			return rowsDeleted > 0;

		} catch (SQLException e) {
			logger.log(Level.SEVERE, "Error deleting profile", e);
			return false;
		}
	}
}
