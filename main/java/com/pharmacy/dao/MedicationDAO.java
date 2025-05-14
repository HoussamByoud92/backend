package main.java.com.pharmacy.dao;

import main.java.com.pharmacy.model.Medication;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class MedicationDAO {
    private final Map<Long, Medication> database = new HashMap<>();
    private long idCounter = 1;

    public Medication findById(Long id) {
        return database.get(id);
    }

    public List<Medication> findAll() {
        return new ArrayList<>(database.values());
    }

    public Medication save(Medication medication) {
        medication.setId(idCounter++);
        database.put(medication.getId(), medication);
        return medication;
    }

    public Medication update(Medication medication) {
        if (database.containsKey(medication.getId())) {
            database.put(medication.getId(), medication);
            return medication;
        }
        return null;
    }

    public void delete(Long id) {
        database.remove(id);
    }

    public List<Medication> findLowStock() {
        return database.values().stream()
                .filter(m -> m.getStock() < 10)
                .collect(Collectors.toList());
    }

    public List<Medication> findExpired() {
        List<Medication> collect = database.values().stream()
                .filter(m -> m.getExpirationDate() != null && m.getExpirationDate().isBefore(LocalDate.now()))
                .collect(Collectors.toList());
        return collect;
    }

    public Map<String, Integer> getMedicationTypeCounts() {
        Map<String, Integer> typeCounts = new HashMap<>();
        for (Medication medication : database.values()) {
            typeCounts.put(
                    medication.getType(),
                    typeCounts.getOrDefault(medication.getType(), 0) + 1
            );
        }
        return typeCounts;
    }
}

